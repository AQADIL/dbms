document.addEventListener('DOMContentLoaded', function() {
    // Initialize particles.js
    particlesJS('particles-js', {
        particles: {
            number: { value: 80, density: { enable: true, value_area: 800 } },
            color: { value: "#ffffff" },
            shape: { type: "circle" },
            opacity: { value: 0.5, random: true },
            size: { value: 3, random: true },
            line_linked: { 
                enable: true, 
                distance: 150, 
                color: "#ffffff", 
                opacity: 0.2, 
                width: 1 
            },
            move: {
                enable: true,
                speed: 2,
                direction: "none",
                random: true,
                straight: false,
                out_mode: "out",
                bounce: false
            }
        },
        interactivity: {
            detect_on: "canvas",
            events: {
                onhover: { enable: true, mode: "grab" },
                onclick: { enable: true, mode: "push" }
            }
        }
    });

    // Language switching
    const setLanguage = (lang) => {
        const texts = {
            en: {
                mainTitle: "Online Quiz System - DBMS Mastery",
                subtitle: "PostgreSQL Assignments Showcase",
                reflectionTitle: "My SQL Journey Reflection",
                reflectionText1: "During my work on SQL assignments...",
                reflectionText2: "Each assignment gave me new knowledge...",
                reflectionText3: "These 6 assignments helped me...",
                reflectionText4: "THANK YOU 😊",
                viewerTitle: "Assignment Viewer"
            },
            ru: {
                mainTitle: "Online Quiz System - Путешествие в DBMS",
                subtitle: "Демонстрация заданий PostgreSQL",
                reflectionTitle: "Размышления о моём SQL-путешествии",
                reflectionText1: "В ходе работы над заданиями по SQL...",
                reflectionText2: "Каждое из заданий дало мне...",
                reflectionText3: "Эти 6 заданий помогли мне...",
                reflectionText4: "СПАСИБО ВАМ 😊",
                viewerTitle: "Просмотр задания"
            }
        };

        Object.entries(texts[lang]).forEach(([id, text]) => {
            const el = document.getElementById(id);
            if (el) el.textContent = text;
        });

        document.getElementById('lang-en').classList.toggle('active', lang === 'en');
        document.getElementById('lang-ru').classList.toggle('active', lang === 'ru');
    };

    document.getElementById('lang-en').addEventListener('click', () => setLanguage('en'));
    document.getElementById('lang-ru').addEventListener('click', () => setLanguage('ru'));

    // PDF Viewer (SIMPLE VERSION)
    const assignmentCards = document.querySelectorAll('.assignment-card');
    const assignmentViewer = document.getElementById('viewer');
    const closeViewer = document.getElementById('close-viewer');
    const pdfViewer = document.getElementById('pdf-viewer');
    const imageViewer = document.getElementById('image-viewer');
    
    assignmentCards.forEach(card => {
        card.addEventListener('click', function() {
            const assignmentNum = this.getAttribute('data-assignment');
            const type = this.getAttribute('data-type');
            
            if (type === 'image') {
                imageViewer.src = `ass${assignmentNum}.png`;
                imageViewer.style.display = 'block';
                pdfViewer.style.display = 'none';
            } else {
                pdfViewer.src = `ass${assignmentNum}.pdf#toolbar=0&navpanes=0&scrollbar=0`;
                pdfViewer.style.display = 'block';
                imageViewer.style.display = 'none';
            }
            
            assignmentViewer.classList.add('active');
            document.body.style.overflow = 'hidden';
            
            // Small celebration
            confetti({
                particleCount: 50,
                spread: 70,
                origin: { y: 0.6 }
            });
        });
    });
    
    closeViewer.addEventListener('click', () => {
        assignmentViewer.classList.remove('active');
        document.body.style.overflow = 'auto';
    });
    
    assignmentViewer.addEventListener('click', (e) => {
        if (e.target === assignmentViewer) closeViewer.click();
    });

    // Theme switcher with animation
    const themeToggle = document.createElement('div');
    themeToggle.className = 'theme-toggle floating-btn';
    themeToggle.innerHTML = '<i class="fas fa-moon"></i>';
    themeToggle.addEventListener('click', () => {
        const isDark = document.documentElement.hasAttribute('data-theme');
        
        if (isDark) {
            document.documentElement.removeAttribute('data-theme');
            themeToggle.innerHTML = '<i class="fas fa-moon"></i>';
        } else {
            document.documentElement.setAttribute('data-theme', 'dark');
            themeToggle.innerHTML = '<i class="fas fa-sun"></i>';
        }
        
        themeToggle.animate([
            { transform: 'scale(1)' },
            { transform: 'scale(1.2)' },
            { transform: 'scale(1)' }
        ], { duration: 300 });
    });
    document.body.appendChild(themeToggle);

    // Add hover effects to cards
    assignmentCards.forEach(card => {
        card.addEventListener('mouseenter', () => {
            card.style.transform = 'translateY(-10px)';
            card.style.boxShadow = '0 15px 30px rgba(0, 0, 0, 0.3)';
        });
        
        card.addEventListener('mouseleave', () => {
            card.style.transform = '';
            card.style.boxShadow = '';
        });
    });

    // Easter egg - Konami code
    const konamiCode = ['ArrowUp', 'ArrowUp', 'ArrowDown', 'ArrowDown', 'ArrowLeft', 'ArrowRight', 'ArrowLeft', 'ArrowRight', 'b', 'a'];
    let konamiIndex = 0;
    
    document.addEventListener('keydown', (e) => {
        if (e.key === konamiCode[konamiIndex]) {
            konamiIndex++;
            
            if (konamiIndex === konamiCode.length) {
                // Massive celebration
                for (let i = 0; i < 5; i++) {
                    setTimeout(() => {
                        confetti({
                            particleCount: 150,
                            spread: 100,
                            origin: { y: 0.6 }
                        });
                    }, i * 300);
                }
                
                konamiIndex = 0;
            }
        } else {
            konamiIndex = 0;
        }
    });
});
