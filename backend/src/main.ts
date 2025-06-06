import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import * as fs from 'fs';

async function bootstrap() {
  /*const httpsOptions = {
    key: fs.readFileSync('/etc/nginx/ssl/live/onadapp.com/fullchain.pem'),
    cert: fs.readFileSync('/etc/nginx/ssl/live/onadapp.com/privkey.pem'),
  };*/

  const app = await NestFactory.create(AppModule);

  app.enableCors({
    origin: true, //debug local
    credentials: true,
  });

  await app.listen(3000);
}
bootstrap();
