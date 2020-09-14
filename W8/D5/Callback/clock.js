class Clock {
    constructor() {
        // 1. Create a Date object.
        this.date = new Date();
        // 2. Store the hours, minutes, and seconds.
        this.hours = this.date.getHours();
        this.minutes = this.date.getMinutes();
        this.seconds = this.date.getSeconds();
        // 3. Call printTime.
        // 4. Schedule the tick at 1 second intervals.
        //.bind returns a function which can then be reinvoked as many times as you want with the context perm bound to what you passed in to .bind
        //
        setInterval(this._tick.bind(this),1000);
    }

    printTime() {
        // Format the time in HH:MM:SS
        let seconds;
        let minutes;
        let hours;
        if(this.seconds < 10){
            seconds = `0${this.seconds}`;
        }else{
            seconds = this.seconds;
        }
        if (this.minutes < 10) {
            minutes = `0${this.minutes}`
        } else {
            minutes = this.minutes;
        }
        if (this.hours < 10) {
            hours = `0${this.hours}`;
        } else {
            hours = this.hours;
        }
        console.log(`${hours}:${minutes}:${seconds}`);
        // Use console.log to print it.
    }

    _tick() {
        // 1. Increment the time by one second.
        // 2. Call printTime.
        if (this.seconds === 59) {
          this.seconds = 0;
          if (this.minutes === 59) {
            this.minutes = 0;
            if (this.hours === 23) {
              this.hours = 0;
            } else {
              this.hours++;
            }
          } else {
            this.minutes++;
          }
        } else {
          this.seconds++;
        }
        this.printTime();
    }
}

const clock = new Clock();