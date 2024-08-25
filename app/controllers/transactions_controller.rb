class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:edit, :update, :destroy]
  before_action :set_accounts, only: [:new, :edit, :create, :update]

  # GET /transactions
  def index
    @transactions = Transaction.where(user_id: current_user.id)
  end

  # GET /transactions/:id
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/:id/edit
  def edit
  end

  # POST /transactions
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user_id = current_user.id
    account = Account.find(@transaction.account_id)
    @transaction.prev_bala = account.balance
    case @transaction.type_id
    when 1 # Assuming 1 means 'Credit'
      account.balance += @transaction.amount
    when 2 # Assuming 2 means 'Debit'
      account.balance -= @transaction.amount
    end
    @transaction.balance = account.balance
    respond_to do |format|
      if @transaction.save
        account.save # Save the updated account balance
        format.html { redirect_to transactions_path, notice: 'Transaction was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /transactions/:id
  def update
    old_amount = @transaction.amount
    respond_to do |format|
      if @transaction.update(transaction_params)
        revert_account_balance(@transaction, old_amount)
        update_account_balance(@transaction)
        format.html { redirect_to transactions_path, notice: 'Transaction was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /transactions/:id
  def destroy
    revert_account_balance(@transaction, @transaction.amount)
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_path, notice: 'Transaction was successfully deleted.' }
    end
  end

  private

  # Method to set transaction for certain actions
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Method to get the available accounts
  def set_accounts
    @accounts = Account.where(user_id: current_user.id)
  end

  # Method to update the account balance after a transaction
  def update_account_balance(transaction)
    account = Account.find(transaction.account_id)
    if transaction.type_id == 1 # Assuming type_id 1 = deposit
      account.update(balance: account.balance + transaction.amount)
    else
      account.update(balance: account.balance - transaction.amount)
    end
  end

  # Method to revert the account balance when a transaction is updated or deleted
  def revert_account_balance(transaction, old_amount)
    account = Account.find(transaction.account_id)
    if transaction.type_id == 1 # Assuming type_id 1 = deposit
      account.update(balance: account.balance - old_amount)
    else
      account.update(balance: account.balance + old_amount)
    end
  end

  # Strong parameters for transactions
  def transaction_params
    params.require(:transaction).permit(:name, :account_id, :balance, :amount, :type_id, :notes, :user_id)
  end
end
