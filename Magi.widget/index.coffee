refreshFrequency: 10000

style: """
    font-size: 25px
    font-family: Futura
    text-transform: uppercase
    opacity: 0.75
    text-align: center
    text-decoration: none
    margin: auto
    .center
        position: absolute
        top: 8em
        left: 36.25em
        background: transparent
        height: 30em
        width: 30em
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
        bottom: -2.16em;
        right: 0;
        border-bottom: 2.2em solid transparent;
        border-left: 3.76em solid rgba(255,10,10,1);
    .bl
        position: absolute
        bottom: -2.16em;
        left: 0;
        border-bottom: 2.2em solid transparent;
        border-right: 3.76em solid rgba(255,10,10,1);
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
        font-size: 1.15em
        width: 4.5em
        color: white
        font-family: Futura
        font-weight: bold
        border: 0.2em solid white
    .serverbox
        opacity: 0.75
        position: absolute
        font-size: 1.25em
        color: white
        font-family: Futura
        font-weight: bold
        border: 0.2em solid white
        top: 37.5%
        left: 33.2%
    .circle1
        opacity: 0.75
        background-color: rgba(204, 0, 102, 0)
        border: 3px solid rgba(191, 191, 191, 1)
        height: 18em
        width: 18em
        position: absolute
        left: 6em
        top: 4.1em
        border-radius: 10em
    .circle2
        opacity: 0.75
        background-color: rgba(204, 0, 102, 0)
        border: 3px solid rgba(191, 191, 191, 1)
        height: 20em
        width: 20em
        position: absolute
        left: 5em
        top: 3.2em
        border-radius: 10em
    .dialog
        font-size: .75em
        position: absolute
        left: 15em
        width: 10em
        height: 3em
        color: rgba(191, 191, 191, 1)
        top: 26.5em
        margin: auto
        font-weight: bold

"""

render: -> """
    <div class="center">
        <div class="circle1"></div>
        <div class="circle2"></div>
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
        <div class="textbox" style="left: 4.0em; top:16.1em">BALTHASAR</div>
        <div class="textbox" style="right:6.5em; top:16.1em">SERVER</div>

        <div class="statusbox" id="ME253" style="left: 10.65em; top:3.75em"> ONLINE </div>
        <div class="statusbox" id="MD103" style="left: 4.25em; top:15.25em"> ONLINE </div>
        <div class="statusbox" id="MD711" style="right:4.25em; top:15.25em"> ONLINE </div>

        <div class="dialog">Alle System Bereit</div>
    </div>
"""
#        <div class="serverbox" style="background:black">HAUPTSERVER</div>
#        <div class="statusbox" id="SERVER" style="left:10.65em; top:11.75em; background:black"> ONLINE </div>


command:    "   sh Magi.widget/me253 &&
                sh Magi.widget/md103 &&
                sh Magi.widget/server
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
        $(domEl).find('#ME253').text("OFFLINE")

    if (parseInt(AllOutputs[1]) == 0)
        $(domEl).find(".left").css("background", "rgba(10,10,10,1)")
        $(domEl).find(".left .br").css("border-left-color", "rgba(10,10,10,1)")
        $(domEl).find(".left .bl").css("border-right-color", "rgba(10,10,10,1)")
        $(domEl).find('#MD103').text("ONLINE")
    else
        $(domEl).find(".left").css("background", "rgba(127,10,10,1)")
        $(domEl).find(".left .br").css("border-left-color", "rgba(127,10,10,1)")
        $(domEl).find(".left .bl").css("border-right-color", "rgba(127,10,10,1)")
        $(domEl).find('#MD103').text("OFFLINE")

    if (parseInt(AllOutputs[2]) == 0)
        $(domEl).find(".right").css("background", "rgba(10,10,10,1)")
        $(domEl).find(".right .br").css("border-left-color", "rgba(10,10,10,1)")
        $(domEl).find(".right .bl").css("border-right-color", "rgba(10,10,10,1)")
        $(domEl).find('#MD711').text("ONLINE")
    else
        $(domEl).find(".right").css("background", "rgba(127,10,10,1)")
        $(domEl).find(".right .br").css("border-left-color", "rgba(127,10,10,1)")
        $(domEl).find(".right .bl").css("border-right-color", "rgba(127,10,10,1)")
        $(domEl).find('#MD711').text("OFFLINE")

    if (parseInt(AllOutputs[0])+parseInt(AllOutputs[1])+parseInt(AllOutputs[2]) == 0)
        $(domEl).find('.dialog').text("Alle System Bereit")
    else
        $(domEl).find('.dialog').text("Code: #{AllOutputs[0]}, #{AllOutputs[1]}, #{AllOutputs[2]}")
