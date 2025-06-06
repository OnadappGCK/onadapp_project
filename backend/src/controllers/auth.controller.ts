import {
  BadRequestException,
  Body,
  Controller,
  Get,
  Post,
  Request,
  UnauthorizedException,
  UseGuards,
} from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { JwtAuthGuard } from 'src/guard/jwt-auth.guard';
import { RegisterDto } from 'src/models/dto/auth-register.dto';
import { AuthService } from 'src/services/auth.service';
import axios from 'axios';
import { CaptchaService } from 'src/services/captcha.service';

@Controller('auth')
export class AuthController {
  constructor(
    private auth: AuthService,
    private configService: ConfigService,
    private captchaService: CaptchaService,
  ) {}

  @Post('register')
  async register(@Body() body: RegisterDto) {
    if (this.configService.get('NODE_ENV') === 'production') {
      if (!body.captcha) throw new UnauthorizedException('Captcha requis');
      await this.captchaService.verify(body.captcha);
    }

    return this.auth.register(body.email, body.password, body.pseudo);
  }

  @Post('login')
  login(@Body() body: { email: string; password: string }) {
    return this.auth.login(body.email, body.password);
  }

  @UseGuards(JwtAuthGuard)
  @Get('profile')
  getProfile(@Request() req) {
    return req.user;
  }
}
