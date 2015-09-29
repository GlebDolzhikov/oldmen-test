module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt)
  require('time-grunt')(grunt)


  path = require('path')

  # Project configuration.
  grunt.initConfig

    appConfig:
      app: require('./bower.json').appPath || 'app'
      dist: 'dist'

    bower_concat:
      dist:
        dest: '<%= appConfig.app %>/js/vendor.js'
        cssDest: '<%= appConfig.app %>/css/lib.css'
        mainFiles: 
          bootstrap: ["dist/css/bootstrap.min.css","dist/js/bootstrap.js"]
    clean:
      rebuild:
        src: 'dist'

    copy:
      dist:
        files: [
          {
            expand: true
            dot: true
            cwd: '<%= appConfig.app %>'
            dest: '<%= appConfig.dist %>'
            src: [
              'js/vendor.js',
              '*.html',
              'views/**/*.html',
              'css/**/*.css'
            ]
          }
        ]
    uglify:
      options: 
        mangle: false
      my_target: 
        files: 
          'dist/js/output.min.js': 'app/js/controllers/home.js'
    connect: 
      server: 
        options: 
          port: 9001
          keepalive: true
          open: 
            target: 'http://localhost:9001/dist/'

    grunt.registerTask 'default', ['clean:rebuild', 'bower_concat:dist', 'uglify','copy:dist','connect' ]

