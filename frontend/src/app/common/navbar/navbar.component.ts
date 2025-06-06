import {
  trigger,
  state,
  style,
  transition,
  animate,
} from '@angular/animations';
import { Component, HostListener, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthService } from 'src/app/auth/auth.service';
import { pageList } from 'src/app/environments/environment.prod';
import { Page } from 'src/app/models/page/page.model';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.scss'],
  animations: [
    trigger('sideMenuOpenClose', [
      transition(':enter', [
        style({ transform: 'translateX(100%)' }),
        animate(100),
      ]),
      transition(':leave', [
        animate(100, style({ transform: 'translateX(100%)' })),
      ]),
    ]),
  ],
})
export class NavbarComponent implements OnInit {
  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private auth: AuthService
  ) {
    this.auth.user$.subscribe((u) => (this.user = u));
    console.log(this.user);
  }

  pages: Page[] = pageList;
  windowWidth: number = window.innerWidth;
  sideMenuOpen: boolean = false;

  ngOnInit(): void {}

  user: any;

  logout() {
    this.auth.logout();
  }

  openCloseSideMenu() {
    this.sideMenuOpen = !this.sideMenuOpen;
  }

  navigate(path: string) {
    this.router.navigate([path]);
  }

  @HostListener('window:resize', ['$event'])
  onResize(event: any) {
    this.windowWidth = window.innerWidth;
  }
}
