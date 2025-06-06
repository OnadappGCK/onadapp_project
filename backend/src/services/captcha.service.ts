import { Injectable, UnauthorizedException } from '@nestjs/common';
import { HttpService } from '@nestjs/axios';
import { ConfigService } from '@nestjs/config';
import { firstValueFrom } from 'rxjs';

@Injectable()
export class CaptchaService {
  constructor(
    private http: HttpService,
    private config: ConfigService,
  ) {}

  async verify(token: string): Promise<void> {
    const secret = this.config.get<string>('RECAPTCHA_SECRET');
    const url = `https://www.google.com/recaptcha/api/siteverify`;

    const response$ = this.http.post(url, null, {
      params: {
        secret,
        response: token,
      },
    });

    const { data } = await firstValueFrom(response$);

    if (!data.success) {
      throw new UnauthorizedException('Captcha invalide');
    }
  }
}
