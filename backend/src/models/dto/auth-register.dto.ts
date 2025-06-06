import { IsEmail, IsNotEmpty, Matches, MinLength } from 'class-validator';

export class RegisterDto {
  @IsEmail()
  email: string;

  @Matches(/^(?=.*[A-Z])(?=.*\d).{8,}$/, {
    message: 'Le mot de passe doit contenir au moins 1 majuscule et 1 chiffre',
  })
  password: string;

  @IsNotEmpty()
  pseudo: string;

  @IsNotEmpty()
  captcha: string;
}
