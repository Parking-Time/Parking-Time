// 왜 enum을 쓰지 않았나요? https://engineering.linecorp.com/ko/blog/typescript-enum-tree-shaking

export const Sorting = {
  DISTANCE: '--distance',
  POPULARITY: '--popularity',
} as const;

export type Sorting = typeof Sorting[keyof typeof Sorting];

