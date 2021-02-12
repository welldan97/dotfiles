// Imports
// =============================================================================

const fs = require('fs');

const websites = require('./websites.json');

// Config
// =============================================================================

const nextPath = process.env.NEXT_FILES_PATH;
const tempBuildPath = `${process.env.TEMP_BUILD_PATH}/browsers_dotfiles`;

// Utils
// =============================================================================

const buildFinickyFile = websites => {
  const result = websites => {
    module.exports = {
      defaultBrowser: websites.defaultBrowser,

      handlers: websites.containers.map(c => ({
        match: args => {
          const { urlString } = args;
          const url = urlString.replace(/^https?:\/?\/?/, 'https://');

          finicky.log(JSON.stringify(url, args, undefined, 2));

          return c.matches.some(m =>
            new RegExp(`^[^/]+//(?:[^/]+\.)?${m.replace('.', '\\.')}`).test(
              url,
            ),
          );
        },
        browser: c.browser,
      })),
    };
  };
  return `(${result.toString()})(${JSON.stringify(websites, undefined, 2)})`;
};

// Main
// =============================================================================

const main = async () => {
  const finickyFile = buildFinickyFile(websites);

  console.log(`processing .finicky.js`);
  await fs.promises.writeFile(`${nextPath}/.finicky.js`, finickyFile);
  await fs.promises.writeFile(`${tempBuildPath}/.finicky.js`, finickyFile);
};

main();
