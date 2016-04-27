module.exports = (grunt) ->
  pkg = grunt.file.readJSON 'package.json'

  grunt.initConfig
    pkg: pkg

    jshint:
      all:
        src: ['app/**/*.js']

    testem:
      person:
        options:
          framework: 'mocha'
          launch_in_ci: ['PhantomJS']
          launch_in_dev: ['Chrome']
          before_tests: 'grunt jshint'
          serve_files: [
            # 3rd party libraries
            'node_modules/chai/chai.js'

            # app libraries
            'app/person.js'

            # specification libraries
            'tests/**/*_spec.js'
          ]
          watch_files: ['**/*.js']

  grunt.loadNpmTasks 'grunt-testem-mincer'
  grunt.loadNpmTasks 'grunt-contrib-jshint'

  grunt.registerTask 'default', ['testem:run:person']
  grunt.registerTask 'spec', ['testem:ci:person']
