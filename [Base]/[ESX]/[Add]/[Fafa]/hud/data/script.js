window.addEventListener('message', (event) => {
    const data = event.data;

    if (data.action === 'updateSpeedometer') {
        const speed = data.speed;
        document.getElementById('speed-text').innerHTML = `
            <div id="speed-number">${Math.round(speed)}</div>
            <div id="speed-unit">km/h</div>
        `;

        const maxSpeed = 360;
        const progress = (speed / maxSpeed) * 100;
        const radius = 40;
        const startAngle = -210;
        const angle = (progress / 100) * 360;
        const endAngle = startAngle + angle;

        const startX = 50 + radius * Math.cos(startAngle * (Math.PI / 180));
        const startY = 50 + radius * Math.sin(startAngle * (Math.PI / 180));
        const endX = 50 + radius * Math.cos(endAngle * (Math.PI / 180));
        const endY = 50 + radius * Math.sin(endAngle * (Math.PI / 180));
        const largeArcFlag = angle > 180 ? 1 : 0;
        const pathData = `M${startX},${startY} A${radius},${radius} 0 ${largeArcFlag},1 ${endX},${endY}`;

        const progressBar = document.getElementById('progress-bar');
        if (progressBar) {
            progressBar.setAttribute('d', pathData);
        }

    } else if (data.action === 'updateFuel') {
        const fuelLevel = data.fuelLevel;
        const maxFuel = 100;

        const fuelProgress = (fuelLevel / maxFuel) * 100; 
        const fuelRadius = 40;
        const startAngle = -210; 
        const fuelAngle = (fuelProgress / 100) * 240;
        let endAngle = startAngle + fuelAngle;

        if (endAngle < -360) {
            endAngle += 360;
        }

        const fuelStartX = 50 + fuelRadius * Math.cos(startAngle * (Math.PI / 180));
        const fuelStartY = 50 + fuelRadius * Math.sin(startAngle * (Math.PI / 180));
        const fuelEndX = 50 + fuelRadius * Math.cos(endAngle * (Math.PI / 180));
        const fuelEndY = 50 + fuelRadius * Math.sin(endAngle * (Math.PI / 180));
        const fuelLargeArcFlag = fuelAngle > 180 ? 1 : 0;
        const fuelPathData = `M${fuelStartX},${fuelStartY} A${fuelRadius},${fuelRadius} 0 ${fuelLargeArcFlag},1 ${fuelEndX},${fuelEndY}`;

        const fuelProgressBar = document.getElementById('fuel-progress-bar');
        if (fuelProgressBar) {
            fuelProgressBar.setAttribute('d', fuelPathData);
        }

    } else if (data.action === 'updateHunger') {
        const hungerBar = document.querySelector('.hunger-bar');
        if (hungerBar) {
            hungerBar.style.width = `${data.hungerLevel}%`; // Utilisez un pourcentage pour remplir la barre
        }

    } else if (data.action === 'updateThirst') {
        const thirstBar = document.querySelector('.thirst-bar');
        if (thirstBar) {
            thirstBar.style.width = `${data.thirstLevel}%`; // Utilisez un pourcentage pour remplir la barre
        }

    } else if (data.action === 'hideHud') {
        const container = document.querySelector("#hud-container");
        if (container) {
            container.style.display = "none";
        }
    } else if (data.action === 'showHud') {
        const container = document.querySelector("#hud-container");
        if (container) {
            container.style.display = "block";
        }
    }
});
