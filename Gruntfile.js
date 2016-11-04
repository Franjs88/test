/**
 * Whole configuration of Grunt for CoffeeScript compilation, project uglification and minification.
 * Adds a task for livereload while developing for the frontend.
 **/
module.exports = function(grunt){
    grunt.initConfig({
        pkg:grunt.file.readJSON('package.json'),
        coffee: {
            options: {
                join: true
            },
            backend: {
                files: [
                    {
                        expand: true,
                        flatten: true,
                        cwd: './backend',
                        src: ['**/*.coffee'],
                        dest: 'build/coffee_compiled/backend',
                        ext: '.js'
                    }
                ]
            },
            frontend: {
                files: [
                    {
                        expand: true,
                        flatten: true,
                        cwd: './frontend',
                        src: ['**/*.coffee'],
                        dest: 'build/coffee_compiled/frontend',
                        ext: '.js'
                    }
                ]

            }
        },
        uglify: {
            options: {
                mangle: false
            },
            backend: {
                // Grunt will search for "**/*.js" under "lib/" when the "uglify" task
                // runs and build the appropriate src-dest file mappings then, so you
                // don't need to update the Gruntfile when files are added or removed.
                files: [
                    {
                        expand: true,     // Enable dynamic expansion.
                        cwd: './build/coffee_compiled/backend',      // Src matches are relative to this path.
                        src: ['**/*.js'], // Actual pattern(s) to match.
                        dest: 'build',   // Destination path prefix.
                        ext: '.js',   // Dest filepaths will have this extension.
                        extDot: 'first'   // Extensions in filenames begin after the first dot
                    }
                ]
            },
            frontend: {
                files: [
                    {
                        expand: true,     // Enable dynamic expansion.
                        cwd: './build/coffee_compiled/frontend',      // Src matches are relative to this path.
                        src: ['**/*.js'], // Actual pattern(s) to match.
                        dest: 'build/frontend/js',   // Destination path prefix.
                        ext: '.js',   // Dest filepaths will have this extension.
                        extDot: 'first'   // Extensions in filenames begin after the first dot
                    },
                ]
            }
        },
        htmlmin: {
            minify: {
                options: {
                    removeComments: true,
                    collapseWhitespace: true
                },
                files: [
                    {
                        expand: true,     // Enable dynamic expansion.
                        cwd: './frontend/',      // Src matches are relative to this path.
                        src: ['**/*.html'], // Actual pattern(s) to match.
                        dest: 'build/frontend/',   // Destination path prefix.
                        ext: '.html',   // Dest filepaths will have this extension.
                        extDot: 'first'   // Extensions in filenames begin after the first dot
                    },
                ]
            }
        },
        cssmin: {
            options: {
                shorthandCompacting: false,
                roundingPrecision: -1
            },
            target: {
                files: [
                    {
                        expand: true,     // Enable dynamic expansion.
                        cwd: './frontend/css',      // Src matches are relative to this path.
                        src: ['*.css'], // Actual pattern(s) to match.
                        dest: 'build/frontend/css',   // Destination path prefix.
                        ext: '.css',   // Dest filepaths will have this extension.
                        extDot: 'first'   // Extensions in filenames begin after the first dot
                    },
                ]
            }

        },
        watch:{
            coffee: {
                files: ['backend/*.coffee','frontend/*.coffee'],
                tasks: ['coffee']
            },
            livereload: {
                // Here we watch the files the coffee task will compile to
                // These files are sent to the live reload server after coffee compiles to them
                options: { livereload: true },
                files:['build/frontend/**','build/backend/**']
            }
        },
        express:{
            all:{
                options:{
                    port:3000,
                    hostname:'localhost',
                    bases:['build/frontend'],
                    livereload:true
                }
            }
        },
        clean: {
            folder: ['./build']
        }
    });

    // Load the plugins
    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-htmlmin');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-express');

    // Register tasks
    grunt.registerTask('build',['clean','coffee', 'uglify','htmlmin','cssmin']);
    grunt.registerTask('default', ['build','express','watch']);

};
