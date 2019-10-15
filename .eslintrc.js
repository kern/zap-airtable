'use strict';

const path = require('path');

module.exports = {
  extends: [
    '@strv/node/v12',
    '@strv/node/optional',
    '@strv/node/style',
    '@strv/typescript',
    '@strv/typescript/optional',
    '@strv/typescript/style',
    'prettier',
    'prettier/@typescript-eslint'
  ],
  plugins: [
    "prettier"
  ],
  parserOptions: {
    project: "tsconfig.json"
  }
};
