module.exports = (grunt) ->
  grunt.initConfig
    concat:
      coffee:
        src: './src/{,*/}*.coffee'
        dest: './js/server.coffee'

    coffee:
      options:
        sourceMap: true
        sourceRoot: ''

      script:
        src:  './js/server.coffee'
        dest: './js/server.js'

    shell:
      options:
        stdout: true
        stderr: true
        failOnError: true

    clean:
      js: ['js']

  require('load-grunt-tasks') grunt

  grunt.registerTask 'build', [
    'clean:js'
    'concat:coffee'
    'coffee:script'
  ]
