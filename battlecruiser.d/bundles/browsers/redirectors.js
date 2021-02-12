// Imports
// =============================================================================

const fs = require('fs');

const websites = require('./websites.json');

// Config
// =============================================================================

const tempBuildPath = `${process.env.TEMP_BUILD_PATH}/browsers_dotfiles`;

// Utils
// =============================================================================

const isEqualBrowser = (a, b) =>
  a === b || (a.name && a.name === b.name && a.profile === b.profile);

const getBrowserName = browser =>
  browser.name ? `${browser.name} - ${browser.profile}` : browser;

const buildRedirectorsFile = (websites, browser) => {
  const excludeMatches = websites.containers
    .filter(c => isEqualBrowser(c.browser, browser))
    .flatMap(c => c.matches);

  const excludePattern = excludeMatches.length
    ? `^[^/]+//(?:[^/]+\.)?((${excludeMatches.join(')|(')}))/`
    : null;

  const redirects = []; /*websites.containers
    .filter(c => !isEqualBrowser(c.browser, browser))
    .map(c => ({
      description: c.name,
      exampleUrl: `http://${c.matches[0]}`,
      error: null,
      includePattern: `@^[^/]+//(?:[^/]+\.)?(${c.matches.join(')|(')})`,
      excludePattern: null,
      patternDesc: '',
      redirectUrl: 'finicky://$2',
      patternType: 'R',
      processMatches: 'noProcessing',
      disabled: false,
      grouped: false,
      appliesTo: ['main_frame'],
    }));
*/
  if (!isEqualBrowser(browser, websites.defaultBrowser)) {
    redirects.push({
      description: 'All unmatched',
      exampleUrl: 'http://example.com',
      error: null,
      includePattern: '^[^/]+//(.*)$',
      excludePattern,
      patternDesc: '',
      redirectUrl: 'finicky://$1',
      patternType: 'R',
      processMatches: 'noProcessing',
      disabled: false,
      grouped: false,
      appliesTo: ['main_frame'],
    });
  }

  return {
    createdBy: 'Battlecruiser v. 0.0.1',
    createdAt: '2021-01-27T18:48:48.834Z',
    redirects,
  };
};

// Main
// =============================================================================

const main = async () => {
  const redirectorsFiles = websites.redirectors.map(b => [
    b,
    buildRedirectorsFile(websites, b),
  ]);

  await Promise.all(
    redirectorsFiles.map(async ([browser, redirects]) => {
      console.log(`processing redirectors/${getBrowserName(browser)}.json`);

      await fs.promises.mkdir(`${tempBuildPath}/redirectors`, {
        recursive: true,
      });

      return fs.promises.writeFile(
        `${tempBuildPath}/redirectors/${getBrowserName(browser)}.json`,
        JSON.stringify(redirects, undefined, 2),
      );
    }),
  );
};

main();
