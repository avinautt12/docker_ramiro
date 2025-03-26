import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-login',
  imports: [CommonModule, FormsModule],
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent {

  
  email: string = '';
  password: string = '';
  isLoading: boolean = false;
  errorMessage: string = '';

  login() {
    this.isLoading = true;
    this.errorMessage = '';

    setTimeout(() => {
      if (this.email === 'admin@gmail.com' && this.password === 'admin1234') {
        console.log('Inicio de sesión exitoso');
      } else {
        this.errorMessage = 'Correo o contraseña incorrectos.';
      }
      this.isLoading = false;
    }, 2000);
  }
}
