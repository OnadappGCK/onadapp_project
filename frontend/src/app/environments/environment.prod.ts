import { Page } from '../models/page/page.model';

/**
 * environment constant
 */
export const environment = {
  production: false,
  urls: {
    baseApiUrl: '/api',
    apiPathLogin: '/oauth2/authorization/default',
    apiPathLogout: '/logout',
    apiPathRevokeUser: '/api/revoke/',
  },
  applicationName: 'onadapp',
  useRecaptcha: true,
  recaptchaSiteKey: '6LfOn0crAAAAAKGeGuOsn6C0bTg0e8mHFDqabxQE',
  // fake login LOCAL
  localSecurity: true,
  localUserEmail: null, // null means default user (admin)
};

export const pageList: Page[] = [
  { id: 1, name: 'Accueil', path: '' },
  { id: 2, name: 'Onakine', path: '/onakine' },
  { id: 3, name: 'Contact', path: '/contact' },
];
