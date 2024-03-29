// Imports
// =============================================================================

const fs = require('fs');

const websites = require('./websites.json');

const tempBuildPath = `${process.env.TEMP_BUILD_PATH}/browsers_dotfiles`;

// Main
// =============================================================================
const getBrowserName = browser => {
  if (browser.profile) return `${browser.name} - ${browser.profile}`;
  if (browser.name) return browser.name;
  return browser;
};

const main = async () => {
  const result = websites.containers
    .filter(c => getBrowserName(c.browser) === 'Firefox')
    .reduce((acc, c) => {
      return [
        ...acc,
        ...c.matches.map(u => [
          `@^[^/]+//(?:[^/]+\.)?${u.replace('.', '\\.')}/`,
          c.name,
        ]),
      ];
    }, []);

  const textResult = result.map(l => l.join(' , ')).join('\n');

  await fs.promises.mkdir(tempBuildPath, {
    recursive: true,
  });

  await fs.promises.writeFile(`${tempBuildPath}/containerise.csv`, textResult);
};

main();
