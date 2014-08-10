module.exports = (grunt) ->
  grunt.initConfig
    nodeunit:
      all: [
        'dist/test-all.js'
      ]
      unit: [
        'dist/test-unit.js'
      ]
      integration: [
        'dist/test-integration.js'
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

      test_all:
        src: [
          './src/requests.coffee'
          './src/*/**/*.coffee'
          './tests/**/*.coffee'
        ]
        dest: './dist/test-all.coffee'

      test_unit:
        src: [
          './src/requests.coffee'
          './src/*/**/*.coffee'
          './tests/unit/**/*.coffee'
        ]
        dest: './dist/test-unit.coffee'

      test_integration:
        src: [
          './src/requests.coffee'
          './src/*/**/*.coffee'
          './tests/integration/**/*.coffee'
        ]
        dest: './dist/test-integration.coffee'

    coffee:
      options:
        sourceMap: true
        sourceRoot: ''

      src:
        src:  './dist/server.coffee'
        dest: './dist/server.js'

      test_all:
        src:  './dist/test-all.coffee'
        dest: './dist/test-all.js'

      test_unit:
        src:  './dist/test-unit.coffee'
        dest: './dist/test-unit.js'

      test_integration:
        src:  './dist/test-integration.coffee'
        dest: './dist/test-integration.js'

    clean:
      dist: ['dist']

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
  ]

  grunt.registerTask 'test', [
    'test-integration'
  ]

  grunt.registerTask 'test-all', [
    'clean:dist'
    'concat:test_all'
    'coffee:test_all'
    'nodeunit:all'
  ]

  grunt.registerTask 'test-unit', [
    'clean:dist'
    'concat:test_unit'
    'coffee:test_unit'
    'nodeunit:unit'
  ]

  grunt.registerTask 'test-integration', [
    'clean:dist'
    'concat:test_integration'
    'coffee:test_integration'
    'nodeunit:integration'
  ]

  grunt.registerTask 'default', [
    'clean:dist'
    'concat:src'
    'coffee:src'
    'express:dev'
  ]

