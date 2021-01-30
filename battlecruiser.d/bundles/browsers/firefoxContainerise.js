// Imports
// =============================================================================

const fs = require('fs');

const websites = require('./websites.json');

const tempBuildPath = process.env.TEMP_BUILD_PATH;

// Main
// =============================================================================

const main = async () => {
  const result = websites.containers
    .filter(c => c.browser === 'Firefox')
    .reduce((acc, c) => {
      return [...acc, ...c.matches.map(u => [u, c.name])];
    }, []);

  const textResult = result.map(l => l.join(' , ')).join('\n');

  await fs.promises.mkdir(`${tempBuildPath}/browsers_dotfiles`, {
    recursive: true,
  });

  await fs.promises.writeFile(
    `${tempBuildPath}/browsers_dotfiles/containerise.csv`,
    textResult,
  );
};

main();
