module.exports = (grunt) ->
  grunt.initConfig
    mochaTest:
      all:
        options:
          reporter: 'spec'
        src: 'dist/test-all.js'
      unit:
        options:
          reporter: 'spec'
        src: 'dist/test-unit.js'
      
      integration:
        options:
          reporter: 'spec'
        src: 'dist/test-integration.js'

    uglify:
      dist:
        src: 'dist/server.js',
        dest: 'dist/server.min.js'

    concat:
      src:
        src: [
          './src/env.coffee'
          './src/env/<%= node_env %>/**/*.coffee'
          './src/init/**/*.coffee'
          './src/model/**/*.coffee'
          './src/controller/**/*.coffee'
          './src/routes/**/*.coffee'
          './src/server.coffee'
        ]
        dest: './dist/server.coffee'

      test_all:
        src: [
          './tests/all.coffee'
          './src/env.coffee'
          './src/env/<%= node_env %>/**/*.coffee'
          './src/init/**/*.coffee'
          './src/model/**/*.coffee'
          './src/controller/**/*.coffee'
          './src/routes/**/*.coffee'
          './tests/*/**/*.coffee'
        ]
        dest: './dist/test-all.coffee'

      test_unit:
        src: [
          './tests/unit.coffee'
          './src/env.coffee'
          './src/env/<%= node_env %>/**/*.coffee'
          './src/init/**/*.coffee'
          './src/model/**/*.coffee'
          './src/controller/**/*.coffee'
          './src/routes/**/*.coffee'
          './tests/unit/**/*.coffee'
        ]
        dest: './dist/test-unit.coffee'

      test_integration:
        src: [
          './tests/integration.coffee'
          './src/env.coffee'
          './src/env/<%= node_env %>/**/*.coffee'
          './src/init/**/*.coffee'
          './src/model/**/*.coffee'
          './src/controller/**/*.coffee'
          './src/routes/**/*.coffee'
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

    env:
      development:
        NODE_ENV: process.env.NODE_ENV || 'development'
      production:
        NODE_ENV: process.env.NODE_ENV || 'production'
      test:
        NODE_ENV: process.env.NODE_ENV || 'test'
  node_env: "<%= env.development.NODE_ENV %><%= env.production.NODE_ENV %><%= env.test.NODE_ENV %>"


  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-express-server'
  grunt.loadNpmTasks 'grunt-mocha-test'
  grunt.loadNpmTasks 'grunt-env'

  require('load-grunt-tasks') grunt

  grunt.registerTask 'build', [
    'env:production'
    'clean:dist'
    'concat:src'
    'coffee:src'
    'uglify:dist'
  ]

  grunt.registerTask 'test', [
    'test-integration'
  ]

  grunt.registerTask 'test-all', [
    'env:test'
    'clean:dist'
    'concat:test_all'
    'coffee:test_all'
    'mochaTest:all'
  ]

  grunt.registerTask 'test-unit', [
    'env:test'
    'clean:dist'
    'concat:test_unit'
    'coffee:test_unit'
    'mochaTest:unit'
  ]

  grunt.registerTask 'test-integration', [
    'env:test'
    'clean:dist'
    'concat:test_integration'
    'coffee:test_integration'
    'mochaTest:integration'
  ]

  grunt.registerTask 'default', [
    'env:development'
    'clean:dist'
    'concat:src'
    'coffee:src'
    'express:dev'
  ]
