let s:battery_status_output_flag = "show"

function! BatteryStatus()

    if s:battery_status_output_flag == "show"

        let l:status = system("~/battery_status.sh")
        echo join(split(l:status))
        let s:battery_status_output_flag = "clear"
    else
        echo ""
        let s:battery_status_output_flag = "show"

    endif

endfunction

