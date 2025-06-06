import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { QuestionController } from './controllers/question.controller';
import { QuestionService } from './services/question.service';
import { AuthModule } from './module/auth.module';
import { User } from './entities/user.entity';
import { Pool } from 'pg';
import { ConfigModule } from '@nestjs/config';

@Module({
  imports: [
    AuthModule,

    TypeOrmModule.forRoot({
      type: 'postgres',
      host: 'cg865595-001.eu.clouddb.ovh.net',
      port: 35247,
      username: 'onadapp',
      password: 'Onadapp13960',
      database: 'onadapp_main',
      ssl: {
        rejectUnauthorized: false,
      },
      entities: [User],
      synchronize: true, // à désactiver en prod
    }),

    TypeOrmModule.forFeature([User]),

    ConfigModule.forRoot({
      isGlobal: true, // rend disponible partout
      envFilePath: `.env${process.env.NODE_ENV === 'production' ? '.production' : ''}`,
    }),
  ],

  controllers: [QuestionController],

  providers: [
    QuestionService,
    {
      provide: Pool,
      useValue: new Pool({
        host: 'cg865595-001.eu.clouddb.ovh.net',
        port: 35247,
        user: 'onadapp',
        password: 'Onadapp13960',
        database: 'onadapp_main',
        ssl: {
          rejectUnauthorized: false,
        },
      }),
    },
  ],
  exports: [Pool], // <-- pour utiliser Pool dans d'autres modules si nécessaire
})
export class AppModule {}
