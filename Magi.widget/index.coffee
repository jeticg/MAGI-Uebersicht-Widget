refreshFrequency: 5000

style: """
    font-family: Futura
    text-transform: uppercase
    position:absolute
    opacity: 0.75
    text-align:center
    text-decoration:none
    .center
        position: absolute
        background: transparent
        height: 30em
        width: 30em
        top:  12em
        left: 28em
        vertical-align: middle

    .top
        position: absolute
        background: rgba(255,10,10,1)
        height: 11em
        width: 7.5em
        left: 11.25em

    .left
        position: absolute
        background: rgba(255,10,10,1)
        height: 11em
        width: 7.5em
        top: 12.25em
        left: 4.25em
        transform: rotate(-120deg)
    .right
        position: absolute
        background: rgba(255,10,10,1)
        height: 11em
        width: 7.5em
        top: 12.25em
        right: 4.25em
        transform: rotate(120deg)
    .br
        position: absolute
        bottom: -2.2em;
        right: 0;
        border-bottom: 2.2em solid transparent;
        border-left: 3.75em solid rgba(255,10,10,1);
    .bl
        position: absolute
        bottom: -2.2em;
        left: 0;
        border-bottom: 2.2em solid transparent;
        border-right: 3.75em solid rgba(255,10,10,1);
    .numbox
        opacity: 0.75
        position: absolute
        font-size: 3.75em
        color: white
    .textbox
        opacity: 0.75
        position: absolute
        font-size: 1em
        color: white
        font-family: Lucida Grande
        font-weight: bold
    .statusbox
        opacity: 0.75
        position: absolute
        font-size: 1.5em
        color: white
        font-family: Lucida Grande
        font-weight: bold
        border: 0.15em solid white

"""

render: -> """
    <div class="center">
        <div class="top">
            <div class="bl"></div>
            <div class="br"></div>
        </div>
        <div class="left">
            <div class="bl"></div>
            <div class="br"></div>
        </div>
        <div class="right">
            <div class="bl"></div>
            <div class="br"></div>
        </div>
        <div class="numbox" style="left: 3.7em;  top:1.6em">1</div>
        <div class="numbox" style="left: 2.7em;  top:3.5em">2</div>
        <div class="numbox" style="right:2.7em; top:3.5em">3</div>


        <div class="textbox" style="left: 12.25em; top:10em">MELCHIOR</div>
        <div class="textbox" style="left: 6.0em; top:16.1em">BALTHA</div>
        <div class="textbox" style="right:6.5em; top:16.1em">CASPER</div>

        <div class="statusbox" id="ME253" style="left: 8em;  top:2.5em"> ONLINE </div>
        <div class="statusbox" id="MD103" style="left: 2.5em; top:11.75em"> ONLINE </div>
        <div class="statusbox" id="MD711" style="right:2.5em; top:11.75em"> ONLINE </div>
    </div>
"""

command:    "   sh Magi.widget/me253 &&
                sh Magi.widget/md103 &&
                sh Magi.widget/md711
            "
#afterRender: (domEl) ->


update: (output, domEl) ->
    AllOutputs = output.split('\n')
    if (parseInt(AllOutputs[0]) == 0)
        $(domEl).find(".top").css("background", "rgba(10,10,10,1)")
        $(domEl).find(".top .br").css("border-left-color", "rgba(10,10,10,1)")
        $(domEl).find(".top .bl").css("border-right-color", "rgba(10,10,10,1)")
        $(domEl).find('#ME253').text("ONLINE")
    else
        $(domEl).find(".top").css("background", "rgba(127,10,10,1)")
        $(domEl).find(".top .br").css("border-left-color", "rgba(127,10,10,1)")
        $(domEl).find(".top .bl").css("border-right-color", "rgba(127,10,10,1)")
        $(domEl).find('#ME253').text("OFFLIN")

    if (parseInt(AllOutputs[1]) == 0)
        $(domEl).find(".left").css("background", "rgba(10,10,10,1)")
        $(domEl).find(".left .br").css("border-left-color", "rgba(10,10,10,1)")
        $(domEl).find(".left .bl").css("border-right-color", "rgba(10,10,10,1)")
        $(domEl).find('#MD103').text("ONLINE")
    else
        $(domEl).find(".left").css("background", "rgba(127,10,10,1)")
        $(domEl).find(".left .br").css("border-left-color", "rgba(127,10,10,1)")
        $(domEl).find(".left .bl").css("border-right-color", "rgba(127,10,10,1)")
        $(domEl).find('#MD103').text("OFFLIN")

    if (parseInt(AllOutputs[2]) == 0)
        $(domEl).find(".right").css("background", "rgba(10,10,10,1)")
        $(domEl).find(".right .br").css("border-left-color", "rgba(10,10,10,1)")
        $(domEl).find(".right .bl").css("border-right-color", "rgba(10,10,10,1)")
        $(domEl).find('#MD711').text("ONLINE")
    else
        $(domEl).find(".right").css("background", "rgba(127,10,10,1)")
        $(domEl).find(".right .br").css("border-left-color", "rgba(127,10,10,1)")
        $(domEl).find(".right .bl").css("border-right-color", "rgba(127,10,10,1)")
        $(domEl).find('#MD711').text("OFFLIN")
#   functions
    # This is for the warning animations, for better battery life, please consider changing these settings
