import { trigger, animate, style, group, query, transition } from '@angular/animations';

export const fadeAndScaleInOut =
  trigger('fadeAndScaleInOut', [
    transition('* <=> *', [
      group([
        query(':enter', [
          style({
            position: 'absolute',
            opacity: 0,
            transform: 'scale(0.8)'
          }),
          animate('300ms 300ms cubic-bezier(0.18, 0.89, 0.32, 1.28)', style({
            opacity: 1,
            transform: 'scale(1)'
          }))
        ], { optional: true }),
        query(':leave', [
          style({
            opacity: 1,
            transform: 'scale(1)'
          }),
          animate('300ms cubic-bezier(0.18, 0.89, 0.32, 1.28)', style({
            position: 'absolute',
            opacity: 0,
            transform: 'scale(0.8)'
          }))
        ], { optional: true })
      ])
    ])
  ]);
