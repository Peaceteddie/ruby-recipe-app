# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true

pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'bootstrap', to: 'bootstrap.min.js', preload: true
pin '@popperjs/core', to: 'popper.js', preload: true
pin 'recipes', to: 'recipes.js', preload: true
pin 'editor', to: 'editor.js', preload: true

pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.4/dist/jquery.js", preload: true
pin 'uuid', to: 'https://ga.jspm.io/npm:uuid@9.0.0/dist/esm-browser/index.js', preload: true
