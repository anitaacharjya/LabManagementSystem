<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>A4 Page with Diagonal Watermark</title>
    <style>
        /* Set up A4 page size */
        @media print {
            body {
                margin: 0;
                padding: 0;
                width: 210mm;
                height: 297mm;
                background: white;
            }

            .a4-page {
                width: 210mm;
                height: 297mm;
                padding: 20mm;
                box-sizing: border-box;
                position: relative;
            }
        }

        /* Diagonal Watermark */
        .watermark {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) rotate(-45deg); /* Center and rotate */
            font-size: 80px;
            color: rgba(0, 0, 0, 0.08); /* Light gray, very transparent */
            white-space: nowrap;
            z-index: 0;
            pointer-events: none; /* Prevent interaction with watermark */
        }

        /* Content style */
        .content {
            position: relative;
            z-index: 1;
            font-family: Arial, sans-serif;
            font-size: 14px;
            line-height: 1.5;
        }
    </style>
</head>
<body>
    <div class="a4-page">
        <!-- Watermark -->
        <div class="watermark">CONFIDENTIAL</div>

        <!-- Content -->
        <div class="content">
            <h1>Report Title</h1>
            <p>This is a sample A4 page with a diagonal watermark. The watermark spans from corner to corner.</p>
            <p>Ensure that your browser's print settings are set to "A4" for proper scaling.</p>
        </div>
    </div>
</body>
</html>
