
###########################################################################################################################
#                                                                                                                         #
#                                   Law and Power 0.1 by Watchdog0x                                     		  #
#                                   _________________________________________________                                     #
#                                   Et lille spil                                          				  #
#                                   Som bruger Opret, slet, ret og omdøb                                                  #
#                                                                                                                         #
###########################################################################################################################

# Add a Microsoft .NET class

Add-Type -AssemblyName PresentationFramework


function Banner {

    #Clear Console

    Clear-Host

    # Banner

    Write-Host                          "                                                                                                            "
    Write-Host -ForegroundColor "Yello" "    ██╗      █████╗ ██╗    ██╗     █████╗ ███╗   ██╗██████╗     ██████╗  ██████╗ ██╗    ██╗███████╗██████╗  "
    Write-Host -ForegroundColor "Yello" "    ██║     ██╔══██╗██║    ██║    ██╔══██╗████╗  ██║██╔══██╗    ██╔══██╗██╔═══██╗██║    ██║██╔════╝██╔══██╗ "
    Write-Host -ForegroundColor "Yello" "    ██║     ███████║██║ █╗ ██║    ███████║██╔██╗ ██║██║  ██║    ██████╔╝██║   ██║██║ █╗ ██║█████╗  ██████╔╝ "
    Write-Host -ForegroundColor "Yello" "    ██║     ██╔══██║██║███╗██║    ██╔══██║██║╚██╗██║██║  ██║    ██╔═══╝ ██║   ██║██║███╗██║██╔══╝  ██╔══██╗ "
    Write-Host -ForegroundColor "Yello" "    ███████╗██║  ██║╚███╔███╔╝    ██║  ██║██║ ╚████║██████╔╝    ██║     ╚██████╔╝╚███╔███╔╝███████╗██║  ██║ "
    Write-Host                          "                                                                                                            "                        
    Write-Host                          "                                                                                                       "                                                                                          
    Write-Host                          "                                                                                                            "
    Write-Host -ForegroundColor "Magenta" "                                            &&&%&& &&/ ,&&                                                "                                                 
    Write-Host -ForegroundColor "Magenta" "                                          &&     #&.      &&  %&.                                         "
    Write-Host -ForegroundColor "Magenta" "                                    &&&&&&#.     &&.     & .    /&                                        "
    Write-Host -ForegroundColor "Magenta" "                                  &*.     &./&&&& &..   #&.     .&   &.                                   "
    Write-Host -ForegroundColor "Magenta" "                                 &#.&     (&,   &,& .   & .     & .   &                                   "                         
    Write-Host -ForegroundColor "Magenta" "                                 &..  &&.....,&&  & .   &.     & .   &&                                   "
    Write-Host -ForegroundColor "Magenta" "                                &&.    /&& .&&   & &&//&     ,&..   &&                                    " 
    Write-Host -ForegroundColor "Magenta" "                                & .   .   *.. ....&(&&#&  &#& &   &&*&/                                   "
    Write-Host -ForegroundColor "Magenta" "                                &..               .& .&.#..,. *    *.&                                    "
    Write-Host -ForegroundColor "Magenta" "                                 & .                  . .&.        * &                                    " 
    Write-Host -ForegroundColor "Magenta" "                                   &%..                  .        **&                                     "
    Write-Host -ForegroundColor "Magenta" "                                     ,&/.                        **&&                                     "
    Write-Host -ForegroundColor "Magenta" "                                        (&..                    * &                                       "
    Write-Host -ForegroundColor "Magenta" "                                           &&/          %       &%                                        "
    Write-Host -ForegroundColor "Magenta" "                                            #&..   ,,..&  &..&&&&                                         " 
    Write-Host -ForegroundColor "Magenta" "                                            &#..      .&  &,.**&                                          "
    Write-Host -ForegroundColor "Magenta" "                                            & ..       &  &,.**&                                          "
    Write-Host -ForegroundColor "Magenta" "                                            & ..       &  &..*,&                                          "
    Write-Host -ForegroundColor "Magenta" "                                           .& .        #  &  *.&                                          " 
    Write-Host -ForegroundColor "Magenta" "                                           &(..       ,   /  */&                                          " 
    Write-Host -ForegroundColor "Magenta" "                                           & ..       %      *#&                                          "
    Write-Host -ForegroundColor "Magenta" "                                          *&..       .&      *&&                                          " 
    Write-Host -ForegroundColor "Magenta" "                                          & ..        %      *&&                                          "
    Write-Host -ForegroundColor "Magenta" "                                         (&..                *&&                                          "
    Write-Host -ForegroundColor "Magenta" "                                         & .         %       *&&                                          "
    Write-Host -ForegroundColor "Magenta" "                                        &&..                 .%&                                          "
    Write-Host -ForegroundColor "Magenta" "                                        & .                   /&                                          "
    Write-Host -ForegroundColor "Magenta" "                                       & .                    ,&                                          "
    Write-Host -ForegroundColor "Magenta" "                                      %&.......................&                                          "
    Write-Host                          "                                                                                                            "
    Write-Host -ForegroundColor "Yellow"   "                             Tryk Enter for at spille eller på Q for at afslutte                          "
  
    # Check if we prees any key with no output

    $continue = (Get-Host).UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") 

    if($continue.Character -like 'q')
    {
        exit
    }
 
}


function Setup_Display {

    # Get the Powershell Window

    $pwindow = (Get-Host).UI.RawUI          

    # Style The Layout

    $pwindow.WindowTitle = "Law and Power"
    $pwindow.BackgroundColor = "black"

    # We use Console Class from .NET to remove blinking Cursor

    [Console]::CursorVisible = $false

    # Resize screen
     
    $newsize = $pwindow.windowsize
    $newsize.height = 55
    $newsize.width  = 110
    $pwindow.windowsize = $newsize 


    # Resize Buffer 

    $newsize = $pwindow.buffersize
    $newsize.height = 55
    $newsize.width = 110
    $pwindow.buffersize = $newsize

}

function Setup_Game { 

    $homepath = $env:HOMEPATH + "\Desktop"

    New-Item -Path $homepath -Name "Law and Power" -ItemType "directory" -Force | Out-Null

    $script:gamepath =  $homepath  + "\Law and Power\"

    Invoke-Item $gamepath
    
    
}

function gameover {
    Clear-Host
       
    Write-Host  "                                                                                                      " 
     Write-Host "      █████████                                           ███████                                     "
     Write-Host "     ███░░░░░███                                        ███░░░░░███                                   "
     Write-Host "     ███     ░░░   ██████   █████████████    ██████     ███     ░░███ █████ █████  ██████  ████████   "
     Write-Host "    ░███          ░░░░░███ ░░███░░███░░███  ███░░███   ░███      ░███░░███ ░░███  ███░░███░░███░░███  "
     Write-Host "    ░███    █████  ███████  ░███ ░███ ░███ ░███████    ░███      ░███ ░███  ░███ ░███████  ░███ ░░░   "
     Write-Host "    ░░███  ░░███  ███░░███  ░███ ░███ ░███ ░███░░░     ░░███     ███  ░░███ ███  ░███░░░   ░███       "
     Write-Host "     ░░█████████ ░░████████ █████░███ █████░░██████     ░░░███████░    ░░█████   ░░██████  █████      "
     Write-Host "      ░░░░░░░░░   ░░░░░░░░ ░░░░░ ░░░ ░░░░░  ░░░░░░        ░░░░░░░       ░░░░░     ░░░░░░  ░░░░░       "
    
}

function Loser {
    $msgBoxInput =  [System.Windows.MessageBox]::Show('Er du en Taber','System :(','YesNo','Error')
    
      switch  ($msgBoxInput) {
    
      'Yes' {
          
        gameover
                                                                                                      
      }
    
      'No' {
    
        Loser
    
      }
    
      }
}

function help_mad_dog {

    CreateFolder -name "Mad Dog" -lvl 5 -hp 500

    Clear-Host

    Write-Host  "                                                                                                          "
    Write-Host  "##########################################################################################################"
    Write-Host  "#                                                                                                        #"
    Write-Host  "# HEY!! HEYYY!!!! HVAD LAVER DUUU!!!.                                                                    #"
    Write-Host  "#                                                                                                        #"
    Write-Host  "##########################################################################################################"
    Write-Host  "                                                                                                          "
   
    Start-Sleep -s 2.5

    Clear-Host

    Write-Host  "                                                                                                          "
    Write-Host  "##########################################################################################################"
    Write-Host  "#                                                                                                        #"
    Write-Host  "# IKK STÅ BARE DER OG GLO KOM OG HJÆLP MIG MED AT NAKKE DET SVIN.                                        #"
    Write-Host  "#                                                                                                        #"
    Write-Host  "##########################################################################################################"
    Write-Host  "                                                                                                          "

    do
    {
        $userResponse = Read-Host -Prompt "Vil du hjælpe? (j/n) "
    }
    while($userResponse -notlike "j" -and $userResponse -notlike "n")
    
    Write-Host ""
    
    Switch ($userResponse) 
    { 
        "j" {return $true}
        "n" {return $false} 
    }

}

function CreateFolder {
    param (
        [string]    $name,
        [int]       $lvl,
        [int]       $hp
    )


    $folder = "{0} LVL {1} HP {2}" -f $name, $lvl, $hp

    New-Item -Path $gamepath -Name $folder -ItemType "directory" -Force | Out-Null

    
}

function RenameFolder {
    param (
        [string]    $name,
        [int]       $lvl,
        [int]       $hp
    )

    $folder = "{0} LVL {1} HP {2}" -f $name, $lvl, $hp

    get-childitem -Path $gamepath | where-object { $_.Name -match $name } | ForEach-Object { rename-item -LiteralPath $_.FullName -NewName $folder -Force}


    
}

function RemoveFolder {
    param (
        [string]    $name
    )
    
    get-childitem -Path $gamepath | where-object { $_.Name -match $name } | ForEach-Object { Remove-Item  $_.FullName }
    
}

function Smokesnake {

    $name = "Smokesnake"
    $lvl = 1
    $hp = 10 
    $min_atk = 1
    $max_atk = 10

    return $name, $lvl, $hp, $min_atk, $max_atk


}
function player {

     # Player variables 
    $lvl = 1
    $hp = 100
    $min_atk = 1
    $max_atk = 10

    return $lvl, $hp, $min_atk, $max_atk


    
}


function Fight([int] $attack) {


   Clear-Host

    Write-Host  "                                                                                                          "
    Write-Host  "                   #####################################################################                  "
    Write-Host  "                                                                                                          "
    Write-Host  "                                                  Choice                                                  "
    Write-Host  "                                                                                                          "
    Write-Host  "                                                A: Attack                                                 "
    Write-Host  "                                                D: Do nothing                                             "
    Write-Host  "                                                                                                          "
    Write-Host  "                   #####################################################################                  "
    Write-Host  "                                                                                                          "

    $userResponse = Read-Host -Prompt "Tryk Enter "

    Switch ($userResponse) 
    { 
        a {Return $attack}
        d {return 0} 
    }

    
}

function Game {
    # Game variables

    $computername = $env:USERDOMAIN
    $username     = $env:USERNAME 
    $PlayerName   = "Spiller"


    $p_lvl, $p_hp, $p_min, $p_max = player  


    CreateFolder -name $PlayerName -lvl $p_lvl -hp  $p_hp

   

    

    Clear-Host

    Write-Host  "                                                                                                          "
    Write-Host  "                   #####################################################################                  "
    Write-Host  "                                                                                                          "
    Write-Host  "                                       Velkommen til Law and Power                                        "
    Write-Host  "                                                                                                          "
    Write-Host  "                   #####################################################################                  "
    Write-Host  "                                                                                                          "
    Write-Host  -ForegroundColor "Yellow" "                                           Tryk Enter for næste                                           "
    
    (Get-Host).UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null
    
    $answer = help_mad_dog
    if($answer -eq $true)
    {   
        
        $m_name, $m_lvl, $m_hp, $m_min, $m_max = Smokesnake
        CreateFolder -name  $m_name -lvl $m_lvl -hp  $m_hp

        while (1) {

          $m_atk = Get-Random -Minimum $m_min -Maximum $m_max
          $p_atk = Get-Random -Minimum $p_min -Maximum $p_max
         
           $m_hp -= Fight($p_atk)
           RenameFolder -name $m_name -lvl $m_lvl -hp $m_hp 

           if ($m_hp -le 0){

               RemoveFolder -name $m_name
               break
                }

            $p_hp -= $m_atk
            RenameFolder -name $PlayerName -lvl $p_lvl -hp $p_hp   
        }

    Clear-Host

    Write-Host  "                                                                                                          "
    Write-Host  "##########################################################################################################"
    Write-Host  "#                                                                                                        #"
    Write-Host  "# Tak for Hjælpen. Jeg hedder faktisk Thor men de klader mig Mad Dog.                                    #"
    Write-Host  "# Hvad hedder du min ven ? :)                                                                            #"
    Write-Host  "#                                                                                                        #"
    Write-Host  "##########################################################################################################"
    Write-Host  "                                                                                                          "
    $PlayerName = Read-Host -Prompt "Hvad hedder du? "
    RemoveFolder -name "Spiller"
    CreateFolder -name $PlayerName -lvl $p_lvl -hp  $p_hp

    Write-Host  "                                                                                                          "
    Write-Host  "##########################################################################################################"
    Write-Host  "#                                                                                                        #"
    Write-Host  "# Jamen Hej $PlayerName, håber du vil tilslutte dig $computername under vores konge $username.           #"
    Write-Host  "# Så vi sammen kan beskytte vores OS, mod de ondsindede filer.                                           #"
    Write-Host  "#                                                                                                        #"
    Write-Host  "##########################################################################################################"
    Write-Host  "                                                                                                          "
    Write-Host  -ForegroundColor "Yellow" "                                           Tryk Enter for næste                                           "
    
    (Get-Host).UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null

    Write-Host  "                                                                                                          "
    Write-Host  "##########################################################################################################"
    Write-Host  "#                                                                                                        #"
    Write-Host  "# Når jeg har ikke tid til at snakke mere, Jeg skal vidre med min misson.                                #"
    Write-Host  "# Her er en lille gave.                                                                                  #"
    Write-Host  "# Jeg håber vi ses ved system32 ;-)                                                                      #"
    Write-Host  "#                                                                                                        #"
    Write-Host  "##########################################################################################################"
    Write-Host  "                                                                                                          "
    Write-Host  -ForegroundColor "Yellow" "                                           Tryk Enter for næste                                           "
    
    (Get-Host).UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null


    Clear-Host

    Write-Host  "                                                                                                          "
    Write-Host  "##########################################################################################################"
    Write-Host  "#                                                                                                        #"
    Write-Host  "# Tak for du har spillet Beta V 0.1 af Daniel Abildgaard                                                 #"
    Write-Host  "# Der vil komme mere i fremtiden når jeg får mere tid                                                    #"
    Write-Host  "#                                                                                                        #"
    Write-Host  "##########################################################################################################"
    Write-Host  "                                                                                                          "
    Write-Host  -ForegroundColor "Yellow" "                                           Tryk Enter for næste                                           "
    
    (Get-Host).UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null
    

    }

    else
    {   Clear-Host

        Write-Host  "                                                                                                          "
        Write-Host  "                   #####################################################################                  "
        Write-Host  "                                                                                                          "
        Write-Host  "                               $computername er tabt til de onde moster :(                                "
        Write-Host  "                                                                                                          "
        Write-Host  "                   #####################################################################                  "
        Write-Host  "                                                                                                          "
        
        Loser
    }
}


Setup_Display
Banner
Setup_Game
Game






