# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "jquery" # @3.7.0
pin_all_from "app/javascript/behaviors", under: "behaviors"
pin "datatables" # @1.13.6
# pin "datatables-bootstrap", to: "https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"
# pin "bootstrap", to: "https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
