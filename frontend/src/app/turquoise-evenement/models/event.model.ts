export interface Event {
  id: number;
  title: string;
  date: string; // 'YYYY-MM-DD'
  timeStart: string; // 'HH:mm'
  timeEnd: string; // 'HH:mm'
  place: string;
  city: string;
  description: string;
  type: 'FEU_ARTIFICE' | 'CONCERT' | 'EXPO' | 'AUTRE';
  iconId: number;
}
