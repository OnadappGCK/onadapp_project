import { JwtModule } from '@nestjs/jwt';
import { PassportModule } from '@nestjs/passport';
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from 'src/entities/user.entity';
import { AuthService } from 'src/services/auth.service';
import { AuthController } from 'src/controllers/auth.controller';
import { JwtStrategy } from 'src/strategies/jwt.strategy';
import { CaptchaService } from 'src/services/captcha.service';
import { HttpModule } from '@nestjs/axios';
import { ConfigModule } from '@nestjs/config';

@Module({
  imports: [
    PassportModule,
    HttpModule,
    ConfigModule,
    JwtModule.register({
      secret: 'secret123',
      signOptions: { expiresIn: '1h' },
    }),
    TypeOrmModule.forFeature([User]),
  ],
  providers: [AuthService, CaptchaService, JwtStrategy],
  controllers: [AuthController],
  exports: [CaptchaService],
})
export class AuthModule {}
