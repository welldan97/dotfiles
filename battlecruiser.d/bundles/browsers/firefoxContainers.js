// Imports
// =============================================================================

const fs = require('fs');

const websites = require('./websites.json');

// Config
// =============================================================================

const homePath = process.env.FINAL_HOME_PATH;
const nextPath = process.env.NEXT_FILES_PATH;
const tempBuildPath = `${process.env.TEMP_BUILD_PATH}/browsers_dotfiles`;
//const homePath = process.env.HOME;
//const nextPath = './temp';
// Utils
// =============================================================================

const basePath = `/Library/Application Support/Firefox/Profiles`;
const profilesDir = `${homePath}/${basePath}`;
const nextProfilesDir = `${nextPath}/${basePath}`;

const getProfiles = async () =>
  new Promise(resolve => fs.readdir(profilesDir, (err, dirs) => resolve(dirs)));

const fileExists = async name =>
  new Promise(resolve =>
    fs.access(name, fs.F_OK, err => {
      if (err) resolve(false);
      else resolve(true);
    }),
  );

const getContainerProfiles = async () => {
  const profiles = await getProfiles();
  const profileExistsMap = await Promise.all(
    profiles.map(profile =>
      fileExists(`${profilesDir}/${profile}/containers.json`),
    ),
  );
  return profileExistsMap.reduce((acc, e, i) => {
    if (!e) return acc;
    return [...acc, profiles[i]];
  }, []);
};

const buildContainersFile = websites => {
  return {
    version: 4,
    lastUserContextId: 1,
    identities: websites.containers
      .filter(c => c.browser === 'Firefox')
      .map((c, i) => {
        const { id, ...options } = websites.containerTypes.find(
          t => c.containerTypeId === t.id,
        );
        return {
          ...options,
          userContextId: i + 1,
          telemetryId: i + 1,
          public: true,
          name: c.name,
        };
      }),
  };
};

// Main
// =============================================================================

const main = async () => {
  const profiles = await getContainerProfiles();
  const constainersFile = buildContainersFile(websites);

  await Promise.all(
    profiles.map(p =>
      fs.promises.mkdir(`${nextProfilesDir}/${p}`, { recursive: true }),
    ),
  );

  await Promise.all(
    profiles.map(p => {
      console.log(`processing ${basePath}/${p}/containers.json`);

      return fs.promises.writeFile(
        `${profilesDir}/${p}/containers.json`,
        JSON.stringify(constainersFile, undefined, 2),
      );
    }),
  );

  console.log(`processing ${tempBuildPath}/containers.json`);

  await fs.promises.writeFile(
    `${tempBuildPath}/containers.json`,
    JSON.stringify(constainersFile, undefined, 2),
  );
};

main();
