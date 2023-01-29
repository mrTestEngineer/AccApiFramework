function fn() {
//  var env = karate.env; // get system property 'karate.env'
  var env = "mock"; // get system property 'karate.env'

  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
//    base_url: 'https://63d1524c3f08e4a8ff9573ce.mockapi.io'
    mock_url: 'http://localhost:8089'
  }

  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }

  karate.log('Environment:', env);
  return config;
}