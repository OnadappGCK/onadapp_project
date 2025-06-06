import {
  BadRequestException,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { User } from 'src/entities/user.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import * as bcrypt from 'bcrypt';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class AuthService {
  constructor(
    @InjectRepository(User) private repo: Repository<User>,
    private jwt: JwtService,
  ) {}

  async register(email: string, password: string, pseudo: string) {
    const existing = await this.repo.findOne({
      where: [{ email }, { pseudo }],
    });

    if (existing) {
      throw new BadRequestException('Email ou pseudo déjà pris');
    }

    const hash = await bcrypt.hash(password, 10);
    const user = this.repo.create({ email, password: hash, pseudo });

    return this.repo.save(user);
  }

  async login(email: string, password: string) {
    const user = await this.repo.findOne({ where: { email } });

    if (!user) {
      throw new UnauthorizedException('Email inexistant');
    }

    const isValid = await bcrypt.compare(password, user.password);

    if (!isValid) {
      throw new UnauthorizedException('Mot de passe incorrect');
    }

    const payload = {
      sub: user.id,
      email: user.email,
      pseudo: user.pseudo,
    };

    const token = this.jwt.sign(payload);

    return {
      message: 'Login réussi',
      user,
      access_token: token,
    };
  }
}
