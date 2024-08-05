export class ApiUseCase {
    constructor() {}

    nullCheckParameters(values: Array<{key: string, value: any}>) {
        for (const value of values) {
            if (value.value == null) {
                throw new Error(`${value.key}값은 필수 값입니다.`);
            }
        }
    }

    generateKeywords(...keywords: string[]): Array<string> {
        const generatedKeywords = new Set<string>();
        generatedKeywords.add('');

        keywords.forEach((keyword) => {
            const words = keyword.toLowerCase().split(' ');

            words.forEach((word) => {
                let current = '';
                for (const char of word) {
                    current += char;
                    generatedKeywords.add(current);
                }
            });

            for (let i = 0; i < words.length; i++) {
                let combined = '';
                for (let j = i; j < words.length; j++) {
                    combined += (j > i ? ' ' : '') + words[j];
                    generatedKeywords.add(combined);

                    let currentCombined = '';
                    for (const word of combined.split(' ')) {
                        for (const char of word) {
                            currentCombined += char;
                            generatedKeywords.add(currentCombined);
                        }
                        currentCombined += ' ';
                    }
                }
            }
        });

        return Array.from(generatedKeywords).sort();
    }

}