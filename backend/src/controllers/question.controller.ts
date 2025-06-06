// question.controller.ts
import { Controller, Get, Param, Res } from '@nestjs/common';
import { Response } from 'express';
import { QuestionService } from '../services/question.service';

@Controller('onakine')
export class QuestionController {
  constructor(private readonly questionService: QuestionService) {}

  @Get('questions/:idList')
  async findNextQuestionsAndAnswers(
    @Param('idList') idListString: string,
    @Res() response: Response,
  ): Promise<void> {
    let idList = [];
    if (idListString) idList = idListString.split(',').map(Number);

    try {
      const structuredResult =
        await this.questionService.findNextQuestionsAndAnswers(idList);
      response.json(structuredResult);
    } catch (err) {
      console.error(err.stack);
      response.status(500).send("Erreur lors de l'exécution de la requête.");
    }
  }

  @Get('result/:idList')
  async findResults(
    @Param('idList') idListString: string,
    @Res() response: Response,
  ): Promise<void> {
    let idList = [];
    if (idListString) idList = idListString.split(',').map(Number);

    try {
      const structuredResult = await this.questionService.findResults(idList);
      response.json(structuredResult);
    } catch (err) {
      console.error(err.stack);
      response.status(500).send("Erreur lors de l'exécution de la requête.");
    }
  }

  @Get('questions')
  async findFirstQuestionsAndAnswers(@Res() response: Response): Promise<void> {
    try {
      const structuredResult =
        await this.questionService.findFirstQuestionsAndAnswers();
      response.json(structuredResult);
    } catch (err) {
      console.error(err.stack);
      response.status(500).send("Erreur lors de l'exécution de la requête.");
    }
  }
}
