module.exports = (grunt) ->
  grunt.initConfig
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

  grunt.loadNpmTasks('grunt-contrib-nodeunit');
  grunt.loadNpmTasks('grunt-contrib-uglify');

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
  ]
