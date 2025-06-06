import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  pseudo: string;

  @Column({ nullable: true })
  firstName?: string;

  @Column({ nullable: true })
  lastName?: string;

  @Column({ default: 'user' })
  role: 'user' | 'admin';

  @Column({ unique: true })
  email: string;

  @Column()
  password: string; // ⚠️ à chiffrer avec bcrypt !
}
