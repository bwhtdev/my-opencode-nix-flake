import js from '@eslint/js';

export default [
  {
    ...js.configs.recommended,
    rules: {
      'no-console': 'warn',
      'no-unused-vars': 'warn'
    },
    languageOptions: {
      parserOptions: {
        ecmaVersion: 'latest',
        sourceType: 'module'
      }
    }
  }
];