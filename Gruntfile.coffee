module.exports = (grunt) ->
  pkg = grunt.file.readJSON 'package.json'

  grunt.initConfig
    pkg: pkg

    testem:
      basic:
        src: ['tests/**/*.js']
        options:
          launch_in_ci: ['PhantomJS']
          launch_in_dev: ['Chrome']

  grunt.loadNpmTasks 'grunt-testem-mincer'

  grunt.registerTask 'default', ['testem:run:basic']
  grunt.registerTask 'spec', ['testem:ci:basic']
