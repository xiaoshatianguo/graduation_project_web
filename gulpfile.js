var gulp = require('gulp');

var browserSync = require('browser-sync').create();

gulp.task('watch',function() {
    browserSync.init({
        //设置监听的文件，以gulpfile.js所在的目录为起点
        files: [
            "app/view/*.tpl",
            "app/view/css/*.css",
            "app/view/js/*.js"
        ],

        ghostMode: {
            clicks: true,
            scroll: true,
            forms: true,
        },

        logPrefix: "browser-sync in gulp",

        browser: ["chrome"],

        proxy: "localhost:9999"
    });
});
