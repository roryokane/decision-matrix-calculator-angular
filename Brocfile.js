var fastBrowserify = require('broccoli-fast-browserify');
var coffeeify = require('coffeeify')
var pickFiles = require('broccoli-static-compiler');
var mergeTrees = require('broccoli-merge-trees');

function wrapTreeContentsInDirectory(tree, directoryName) {
	return pickFiles(tree, {srcDir: '/', destDir: directoryName});
}


var appJsTree = 'js';
var appJsFile = fastBrowserify(appJsTree, {
  bundles: {
    "js/app-js.js": {
      entryPoints: ['app.*'],
      transform: coffeeify,
    }
  },
	browserify: {
		extensions: [".coffee"],
		debug: true,
	},
});

var vendoredJsTree = 'vendor';
vendoredJsTree = wrapTreeContentsInDirectory(vendoredJsTree, 'vendor-js');

var stylesTree = 'style';
stylesTree = wrapTreeContentsInDirectory(stylesTree, 'style');

var publicFilesTree = 'public';

module.exports = mergeTrees([appJsFile, vendoredJsTree, stylesTree, publicFilesTree]);
