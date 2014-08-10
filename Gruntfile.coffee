module.exports = (grunt) ->
  grunt.initConfig
    nodeunit:
      all: [
        'dist/test.js'
      ]
      options:
        reporter: 'tap'

    uglify:
      dist:
        src: 'dist/server.js',
        dest: 'dist/server.min.js'

    concat:
      src:
        src: './src/{,*/}*.coffee'
        dest: './dist/server.coffee'

      test:
        src: [
          './src/**/*.coffee'
          './tests/unit/**/*.coffee'
        ]
        dest: './dist/test.coffee'

    coffee:
      options:
        sourceMap: true
        sourceRoot: ''

      src:
        src:  './dist/server.coffee'
        dest: './dist/server.js'

      test:
        src:  './dist/test.coffee'
        dest: './dist/test.js'

    clean:
      dist: ['dist']
      server: [
        './dist/server.coffee'
        './dist/test.coffee'
        './dist/server.js'
        './dist/test.js'
        './dist/server.js.map'
        './dist/test.js.map'
      ]
      test: [
        './dist/server.coffee'
        './dist/test.coffee'
        './dist/server.js'
        './dist/server.js.map'
        './dist/test.js.map'
      ]

    express:
      options:
        background: false
      dev:
        options:
          script: './dist/server.js'
      prod:
        options:
          script: './dist/server.min.js'
          node_env: 'production'
      test:
        options:
          script: './dist/test.js'

  grunt.loadNpmTasks 'grunt-contrib-nodeunit'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-express-server'

  require('load-grunt-tasks') grunt

  grunt.registerTask 'build', [
    'clean:dist'
    'concat:src'
    'coffee:src'
    'uglify:dist'
    'clean:server'
  ]

  grunt.registerTask 'test', [
    'clean:dist'
    'concat:test'
    'coffee:test'
    'clean:test'
    'nodeunit:all'
  ]

  grunt.registerTask 'default', [
    'clean:dist'
    'concat:src'
    'coffee:src'
    'express:dev'
  ]

