/**
 * Question
 */

import { IdLabel } from 'src/app/models/common/idLabel.model';

export class Question {
  id?: number;
  label: string = '';
  answers: IdLabel[] = [];
  variable: string = '';
  formType: string = ''; // en faire un enum un jour

  /**
   * Model constructor
   */
  constructor() {}
}
