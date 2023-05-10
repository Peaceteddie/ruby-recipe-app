# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascrript/", under: "javascript"
pin "recipes", to: "recipes.js", preload: true
pin "editor", to: "editor.js", preload: true
pin "uuid", to: "https://ga.jspm.io/npm:uuid@9.0.0/dist/esm-browser/index.js", preload: true
