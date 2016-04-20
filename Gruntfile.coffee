module.exports = (grunt) ->
  pkg = grunt.file.readJSON 'package.json'

  grunt.initConfig
    pkg: pkg

    jshint:
      all: ['tests/**/*.js']

    testem:
      tests:
        src: [
          'tests/config.js'
          'tests/*_spec.js'
        ]
        options:
          framework: 'mocha'
          launch_in_ci: ['Chrome']
          launch_in_dev: ['PhantomJS']

#    watch:
#      app:
#        files: ['src/**/*.js']
#        tasks: ['jshint', 'concat:app', 'uglify:app']
#      tmpl:
#        files: ['src/**/*.html']
#        tasks: ['copy:assets', 'copy:index']

  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-testem-mincer'
#  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['jshint', 'tests']
  grunt.registerTask 'tests', ['testem']
