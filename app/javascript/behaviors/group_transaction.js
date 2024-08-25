AKB.Behaviors.group_transaction = function () {
  let $this = $(this);

  $this.click(function (e) {
    e.stopPropagation();
    $('.grouped-table').toggle();
    $('.ungroup-table-wrapper').toggle();
  });
}