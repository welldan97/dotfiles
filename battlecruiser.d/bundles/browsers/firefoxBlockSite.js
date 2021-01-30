// Imports
// =============================================================================

const fs = require('fs');

const websites = require('./websites.json');

const tempBuildPath = process.env.TEMP_BUILD_PATH;

// Main
// =============================================================================

const main = async () => {
  const result = {
    blocked: websites.containers
      .filter(c => c.browser === 'Firefox')
      .map(c => c.matches)
      .flat(),
    close: 0,
    'contextmenu-frame': true,
    'contextmenu-pause': true,
    'contextmenu-resume': true,
    'contextmenu-top': true,
    css: '',
    initialBlock: true,
    map: {},
    message: '',
    'no-password-on-add': false,
    redirect: '',
    reverse: true,
    schedule: {
      times: {},
    },
    schedules: {},
    sha256: '',
    timeout: 60,
    title: true,
    wrong: 1,
    'managed.storage.overwrite.on.start': false,
  };

  const textResult = JSON.stringify(result, undefined, 2);

  await fs.promises.mkdir(`${tempBuildPath}/browsers_dotfiles`, {
    recursive: true,
  });

  await fs.promises.writeFile(
    `${tempBuildPath}/browsers_dotfiles/block-site-preferences.json`,
    textResult,
  );
};

main();
