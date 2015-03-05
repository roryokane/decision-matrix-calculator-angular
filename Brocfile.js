var filterCoffeeScript = require('broccoli-coffee');
var concat = require('broccoli-concat');
var pickFiles = require('broccoli-static-compiler');
var mergeTrees = require('broccoli-merge-trees');

function wrapTreeContentsInDirectory(tree, directoryName) {
	return pickFiles(tree, {srcDir: '/', destDir: directoryName});
}

var appJsTree = 'js';
appJsTree = filterCoffeeScript(appJsTree);
var appJsFile = concat(appJsTree, {
	inputFiles: ['dmc/*', 'todos/*', 'app.*'],
	outputFile: '/js/app-js.js',
});

var vendoredJsTree = 'vendor';
vendoredJsTree = wrapTreeContentsInDirectory(vendoredJsTree, 'vendor-js');

var stylesTree = 'style';
stylesTree = wrapTreeContentsInDirectory(stylesTree, 'style');

var publicFilesTree = 'public';

module.exports = mergeTrees([appJsFile, vendoredJsTree, stylesTree, publicFilesTree]);
