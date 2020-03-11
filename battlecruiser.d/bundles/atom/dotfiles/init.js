// # Your init script
// #
// # Atom will evaluate this file each time a new window is opened. It is run
// # after packages are loaded/activated and after the previous editor state
// # has been restored.
// #
// # An example hack to log to the console when each text editor is saved.
// #
// # atom.workspace.observeTextEditors (editor) ->
// #   editor.onDidSave ->
// #     console.log "Saved! #{editor.getPath()}"
//
const exec = require('child_process').exec;

//atom.packages.activatePackage('emacs-mode');

let altRight = false;
function mapKey(event, code, normal, shift) {
  if (event.code !== code) return;

  let keys = event.shiftKey && shift ? shift : normal;
  if (event.metaKey) keys = `meta-${keys}`;
  if (event.altKey) keys = `alt-${keys}`;
  if (event.ctrlKey) keys = `ctrl-${keys}`;
  return keys;
}

function defaultMapKey(event) {
  let keys = event.key;
  if (keys.length !== 1) return;
  //let keys = event.shiftKey && shift ? shift : normal;
  if (event.shiftKey) keys = `shift-${keys}`;
  if (event.metaKey) keys = `meta-${keys}`;
  if (event.altKey) keys = `alt-${keys}`;
  if (event.ctrlKey) keys = `ctrl-${keys}`;
  return keys;
}

atom.keymaps.addKeystrokeResolver(({ event }) => {
  //console.log(event);
  //if (event.type === 'keydown' && event.code === 'AltRight') altRight = true;
  //if (event.type === 'keyup' && event.code === 'AltRight') altRight = false;
  //  if (!event.altKey) altRight = false;
  if (event.type === 'keyup') return;
  //console.log(altRight);
  if (event.key === 'Unidentified') {
    console.log('welldan97:Unidentified Key', event);
  }

  const result =
    mapKey(event, 'BracketLeft', '/', '?') ||
    mapKey(event, 'KeyW', ',', '<') ||
    mapKey(event, 'KeyE', '.', '>') ||
    mapKey(event, 'KeyU', 'g', 'shift-G');
  //    defaultMapKey(event);
  /*
  if (altRight && result) {
    return result.replace('alt', 'cmd');
  }
*/
  return result;
  // if (
  //   event.key ß'Unidentified' &&
  //   event.code === 'BracketLeft' &&
  //   event.ctrlñKey &&
  //   event.altKey &&
  //   event.shiftKey
  // )
  //   retuññññññrn 'ctrl-alt-?';
  // if (event.key === 'Unidentified' && event.code === 'Bracket
  //   return 'ctrl-alt-/';
  // if (
  //   event.key =ÑÑ= 'BracketLeft' &&
  //   event.ctrlKey &&
  //   event.shiftKey
  // )
  //   return 'ctrl-?';
  // if (event.key === 'Unidentified' && event.code === 'BracketLeft' && event.ctrlKey)
  //   return 'ctrl-/';
  //
  if (event.key === 'Unidentified' && event.code === 'KeyZ' && event.ctrlKey)
    return "ctrl-'";
});

atom.commands.add('atom-text-editor', 'welldan97:jest-coverage', () => {
  exec(
    `./node_modules/.bin/jest --coverage --findRelatedTests ${
      atom.workspace.getActivePaneItem().buffer.file.path
    }`,
    {
      cwd: atom.project.rootDirectories[0].path,
    },
    (error, stdout) => {
      atom.notifications.addInfo(stdout);
    },
  );
});
