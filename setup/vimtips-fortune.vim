" Show vimtips-fortune on Fridays.
let weekday=system("echo -n $(LANG=EN_us date +%A)")
if weekday != "Friday"
    let g:loaded_fortune_vimtips = 1
endif


