import { Page } from '../models/page/page.model';

/**
 * environment constant
 */
export const environment = {
  production: false,
  urls: {
    baseApiUrl: 'http://localhost:3000',
    apiPathLogin: '/oauth2/authorization/default',
    apiPathLogout: '/logout',
    apiPathRevokeUser: '/api/revoke/',
  },
  applicationName: 'onadapp',
  useRecaptcha: false,
  recaptchaSiteKey: '', // vide ou faux pour local
  // fake login LOCALs
  localSecurity: true,
  localUserEmail: null, // null means default user (admin)
};

export const pageList: Page[] = [
  { id: 1, name: 'Accueil', path: '' },
  { id: 2, name: 'Onakine', path: '/onakine' },
  { id: 3, name: 'Contact', path: '/contact' },
];
