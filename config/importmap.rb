# Pin npm packages by running ./bin/importmap
pin "@popperjs/core", to: 
"https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/po
pper.min.js"
pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.bundle.min.js"
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"
