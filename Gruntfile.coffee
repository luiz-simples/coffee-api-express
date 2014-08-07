module.exports = (grunt) ->
  grunt.initConfig
    concat:
      src:
        src: './src/{,*/}*.coffee'
        dest: './js/server.coffee'

      test:
        src: [
          './src/**/*.coffee'
          './tests/unit/**/*.coffee'
        ]
        dest: './js/test.coffee'

    coffee:
      options:
        sourceMap: true
        sourceRoot: ''

      src:
        src:  './js/server.coffee'
        dest: './js/server.js'

      test:
        src:  './js/test.coffee'
        dest: './js/test.js'

    clean:
      js: ['js']

  grunt.loadNpmTasks('grunt-contrib-nodeunit');

  require('load-grunt-tasks') grunt

  grunt.registerTask 'build', [
    'clean:js'
    'concat:src'
    'coffee:src'
  ]

  grunt.registerTask 'test', [
    'clean:js'
    'concat:test'
    'coffee:test'
  ]
